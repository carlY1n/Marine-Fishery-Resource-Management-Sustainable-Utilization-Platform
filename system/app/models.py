from django.db import models

class Account(models.Model):
    account = models.CharField(max_length=255, unique=True)  # 确保账号唯一
    password = models.CharField(max_length=255)

    def __str__(self):
        return self.account