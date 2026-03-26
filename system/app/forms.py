from django import forms
from .models import Account

class AccountForm(forms.ModelForm):
    class Meta:
        model = Account
        fields = ['account', 'password']  # 账号和密码字段

class LoginForm(forms.Form):
    account = forms.CharField(max_length=255, required=True, label='账号')
    password = forms.CharField(max_length=255, required=True, widget=forms.PasswordInput, label='密码')