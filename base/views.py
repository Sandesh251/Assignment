from django.shortcuts import render, redirect, reverse
from django.http import HttpResponse
from django.contrib import messages
from django.contrib.auth.decorators import login_required
from django.db.models import Q
from django.contrib.auth import authenticate, login, logout
from .models import Room, Topic, Message, User
from .forms import RoomForm, UserForm, MyUserCreationForm

# authentication & authorization
def loginPage(request):
    page = 'login'
    if request.user.is_authenticated:
        return redirect('home')

    if request.method == 'POST':
        email = request.POST.get('email').lower()
        password = request.POST.get('password')

        try:
            user = User.objects.get(email=email)
        except:
            messages.error(request, 'User does not exist')

        user = authenticate(request, email=email, password=password)

        if user is not None:
            login(request, user)
            return redirect('home')
        else:
            messages.error(request, 'Username OR password does not exit')

    context = {'page': page}
    return render(request, 'base/login_register.html', context)


def logoutUser(request):
    logout(request)
    return redirect('home')


def registerPage(request):
    form = MyUserCreationForm()

    if request.method == 'POST':
        form = MyUserCreationForm(request.POST)
        if form.is_valid():
            user = form.save(commit=False)
            user.username = user.username.lower()
            user.save()
            login(request, user)
            messages.success(request, 'Account created Successfully.')
            return redirect('home')
        else:
            messages.error(request, 'An error occurred during registration')

    return render(request, 'base/login_register.html', {'form': form})


# search functionality
# for post
def home(request):
    q = request.GET.get('q') if request.GET.get('q') is not None else ''
    context = None
    
    try:
        # Attempt to get the 'Attendance' topic
        attendance_topic = Topic.objects.get(name="Attendance")
        print(f"Attendance Topic Found: {attendance_topic}")
    except Topic.DoesNotExist:
        attendance_topic = None
        # print("Attendance Topic not found.")

    try:
        # Filter rooms based on the query parameter 'q'
        if 'Attendance' not in q:
            rooms = Room.objects.filter(
                Q(topic__name__icontains=q) |
                Q(name__icontains=q) |
                Q(description__icontains=q)
            ).exclude(topic=attendance_topic)
        else:
            rooms = Room.objects.filter(
                Q(topic__name__icontains=q) |
                Q(name__icontains=q) |
                Q(description__icontains=q)
            )
        
        # print(f"Rooms Retrieved: {rooms}")

        # Get the first 5 topics and count of rooms
        topics = Topic.objects.all()[:5]
        room_count = rooms.count()

        # Retrieve the most recent 3 messages
        room_messages = Message.objects.filter(
            Q(room__topic__name__icontains=q)
        )[:3]

        # Build the context dictionary
        context = {
            'rooms': rooms,
            'topics': topics,
            'room_count': room_count,
            'room_messages': room_messages,
        }

    except Exception as e:
        print("Error in home view:", e)

    return render(request, 'base/home.html', context)

# for browse topics
def topicsPage(request):
    q = request.GET.get('q') if request.GET.get('q') != None else ''
    topics = Topic.objects.filter(name__icontains=q)
    return render(request, 'base/topics.html', {'topics': topics})


# chat / Discussion
def room(request, pk):
    room = Room.objects.get(id=pk)
    room_messages = room.message_set.all()
    participants = room.participants.all()

    if request.method == 'POST':
        message = Message.objects.create(
            user=request.user,
            room=room,
            body=request.POST.get('body')
        )
        room.participants.add(request.user)
        return redirect('room', pk=room.id)

    context = {'room': room, 'room_messages': room_messages,
               'participants': participants}
    return render(request, 'base/room.html', context)


@login_required(login_url='login')
def createRoom(request):
    form = RoomForm()
    topics = Topic.objects.all()
    if request.method == 'POST':
        topic_name = request.POST.get('topic')
        topic, created = Topic.objects.get_or_create(name=topic_name)

        Room.objects.create(
            host=request.user,
            topic=topic,
            name=request.POST.get('name'),
            description=request.POST.get('description'),
        )
        return redirect('home')

    context = {'form': form, 'topics': topics}
    return render(request, 'base/room_form.html', context)


@login_required(login_url='login')
def updateRoom(request, pk):
    room = Room.objects.get(id=pk)
    form = RoomForm(instance=room)
    topics = Topic.objects.all()
    if request.user != room.host:
        return HttpResponse('Your are not allowed here!!')

    if request.method == 'POST':
        topic_name = request.POST.get('topic')
        topic, created = Topic.objects.get_or_create(name=topic_name)
        room.name = request.POST.get('name')
        room.topic = topic
        room.description = request.POST.get('description')
        room.save()
        return redirect('home')

    context = {'form': form, 'topics': topics, 'room': room}
    return render(request, 'base/room_form.html', context)


@login_required(login_url='login')
def deleteRoom(request, pk):
    room = Room.objects.get(id=pk)

    if request.user != room.host:
        return HttpResponse('Your are not allowed here!!')

    if request.method == 'POST':
        room.delete()
        messages.success(request, 'Discussion room deleted successfully.')
        return redirect('home')
    return render(request, 'base/delete.html', {'obj': room})




# user profile
def userProfile(request, pk):
    user = User.objects.get(id=pk)
    rooms = user.room_set.all()
    room_messages = user.message_set.all()
    topics = Topic.objects.all()
    context = {'user': user, 'rooms': rooms,
               'room_messages': room_messages, 'topics': topics}
    return render(request, 'base/profile.html', context)

@login_required(login_url='login')
def updateUser(request):
    user = request.user
    form = UserForm(instance=user)

    if request.method == 'POST':
        form = UserForm(request.POST, request.FILES, instance=user)
        if form.is_valid():
            form.save()

            messages.success(request, "Your account has been updated successfully.")
            return redirect('user-profile', pk=user.id)

    return render(request, 'base/update-user.html', {'form': form})



# user activity tracking
def activityPage(request):
    room_messages = Message.objects.all()
    return render(request, 'base/activity.html', {'room_messages': room_messages})

@login_required(login_url='login')
def deleteMessage(request, pk):
    message = Message.objects.get(id=pk)
    room_id = message.room.id
    if request.user != message.user:
        return HttpResponse('Your are not allowed here!!')

    if request.method == 'POST':
        message.delete()
        messages.success(request, "Message has been deleted.")
        return redirect('room', pk=room_id)

    return render(request, 'base/delete.html', {'obj': message})

