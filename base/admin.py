from django.contrib import admin

# Register your models here.

from .models import Room, Topic, Message, User
from django.contrib.auth.admin import UserAdmin

class CustomUserAdmin(UserAdmin):
    list_display = ('email', 'username', 'first_name', 'last_name', 'is_staff') 
    list_filter = ('is_staff', 'is_superuser', 'is_active', 'groups') 
    fieldsets = (
        (None, {'fields': ('email', 'password')}),
        ('Personal Info', {'fields': ('username', 'first_name', 'last_name', 'bio', 'avatar')}),
        ('Permissions', {'fields': ('is_active', 'is_staff', 'is_superuser', 'groups', 'user_permissions')}), 
    )
    add_fieldsets = (
        (None, {
            'classes': ('wide',),
            'fields': ('email', 'username', 'first_name', 'last_name', 'password1', 'password2', 'is_staff', 'is_superuser')
        }),
    )
    search_fields = ('email', 'username', 'first_name', 'last_name') 
    ordering = ('email',) 


admin.site.register(User, CustomUserAdmin)
admin.site.register(Room)
admin.site.register(Topic)
admin.site.register(Message)
