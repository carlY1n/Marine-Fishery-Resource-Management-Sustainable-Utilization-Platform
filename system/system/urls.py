"""
URL configuration for system project.

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/5.1/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path
from app import views

urlpatterns = [
    path("admin/", admin.site.urls),
    path('', views.main, name='main'),
    path('login/', views.login, name='login'),
    path('register/', views.register, name='register'),
    path('main/', views.main, name='main'),
    path('fishing_activities/', views.fishing_activities, name='fishing_activities'),
    path('fishing_resources/', views.fishing_resources, name='fishing_resources'),
    path('marine_environment/', views.marine_environment, name='marine_environment'),
    path('policies/', views.policies, name='policies'),
    path('profile/', views.profile, name='profile'),
    path('recommendations/', views.recommendations, name='recommendations'),
    path('add_account/', views.add_account, name='add_account'),
    path('search_en/',views.search_en, name='search_en'),
    path('maintain_en/',views.maintain_en, name='maintain_en'),
    path('en/',views.en, name='en'),
    path('search_sort/',views.search_sort, name='search_sort'),
    path('maintain_sort/',views.maintain_sort, name='maintain_sort'),
    path('sort/',views.sort, name='sort'),
    path('search_acti/',views.search_acti, name='search_acti'),
    path('maintain_acti/',views.maintain_acti, name='maintain_acti'),
    path('acti/',views.acti, name='acti'),
    path('policies/',views.policies, name='policies'),
    path('recom/',views.recom, name='recom'),
]
