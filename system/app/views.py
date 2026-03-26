from django.shortcuts import render,redirect
from django.http import HttpResponse,JsonResponse
import os
from . import forms
from . import models

def home(request):
    return render(request, 'login.html', locals())

def register(request):
    return render(request, 'register.html', locals())

def main(request):
    return render(request, 'main.html', locals())

def fishing_activities(request):
    return render(request, 'fishing_activities1.html', locals())

def fishing_resources(request):
    return render(request, 'fishing_resources1.html', locals())

def marine_environment(request):
    return render(request, 'marine_environment.html', locals())

def policies(request):
    return render(request, 'policies.html', locals())

def profile(request):
    return render(request, 'profile.html', locals())

def recommendations(request):
    return render(request, 'recommendations.html', locals())

from django.shortcuts import render
from django.http import HttpResponse
import os

def login(request):
    if request.method == 'POST':
        form = forms.LoginForm(request.POST)
        if form.is_valid():
            account = form.cleaned_data['account']
            password = form.cleaned_data['password']

            # 使用模型查询数据库
            try:
                user = models.Account.objects.get(account=account, password=password)
                # 如果匹配成功，跳转到主页面
                return redirect('main')
            except models.Account.DoesNotExist:
                # 如果账号密码不匹配，显示错误消息
                return render(request, 'login.html', {
                    'form': form,
                    'message': '账号或密码不匹配，请重新输入。',
                    'message_type': 'error'
                })
        else:
            return render(request, 'login.html', {
                'form': form,
                'message': '表单数据无效，请重新填写。',
                'message_type': 'error'
            })

    # 如果是 GET 请求，显示空表单
    form = forms.LoginForm()
    return render(request, 'login.html', {'form': form})


def add_account(request):
    if request.method == 'POST':
        form = forms.AccountForm(request.POST)
        if form.is_valid():
            account = form.cleaned_data['account']
            password = form.cleaned_data['password']

            # 检查账号是否已存在
            if models.Account.objects.filter(account=account).exists():
                return JsonResponse({'success': False, 'message': '该账号已存在，请选择其他账号。'})

            # 保存账号信息
            form.save()
            return JsonResponse({'success': True, 'message': '账号添加成功！'})


    # 如果是 GET 请求，显示空表单
    form = forms.AccountForm()
    return JsonResponse({'success': False, 'message': '非法请求！'})

from django.shortcuts import render
from django.db import connection

def search_en(request):
    time = None
    water_quality = None
    water_temp = None
    salinity = None

    if request.method == 'POST':
        sea_area = request.POST.get('sea_area')  # 获取用户输入的海域编号
        print(f"用户输入的海域编号: {sea_area}")  # 打印用户输入的海域编号
        
        try:
            sea_area = int(sea_area)  # 转换为整数
            
            # 使用 raw SQL 查询数据库
            with connection.cursor() as cursor:
                print(f"执行 SQL 查询，查询海域编号为: {sea_area}")  # 打印执行查询的海域编号
                
                cursor.execute("""
                    SELECT collection_time, water_quality, water_temperature, salinity
                    FROM environment_data
                    WHERE marine = %s
                """, [sea_area])
                result = cursor.fetchone()
                
                print(f"查询结果: {result}")  # 打印查询结果

                if result:
                    time, water_quality, water_temp, salinity = result
                else:
                    time = "未找到相关数据"
                    water_quality = "未找到相关数据"
                    water_temp = "未找到相关数据"
                    salinity = "未找到相关数据"
        except ValueError:
            time = "输入错误"
            water_quality = "输入错误"
            water_temp = "输入错误"
            salinity = "输入错误"
        except Exception as e:
            time = "查询错误"
            water_quality = "查询错误"
            water_temp = "查询错误"
            salinity = "查询错误"
            print(f"错误信息: {str(e)}")  # 打印错误信息

    return render(request, 'marine_environment.html', {
        'time': time,
        'water_quality': water_quality,
        'water_temp': water_temp,
        'salinity': salinity
    })

def en(request):
    return render(request, 'maintain_en.html', locals())

from django.shortcuts import render, redirect
from django.db import connection

from django.shortcuts import render, redirect
from django.db import connection
import logging

# 配置日志记录
logger = logging.getLogger(__name__)

def maintain_en(request):
    if request.method == 'POST':
        sea_area = request.POST.get('sea_area')
        time = request.POST.get('time')
        water_quality = request.POST.get('water_quality')
        water_temp = request.POST.get('water_temp')
        salinity = request.POST.get('salinity')

        # 打印调试信息
        logger.debug(f"Received POST data: sea_area={sea_area}, time={time}, water_quality={water_quality}, water_temp={water_temp}, salinity={salinity}")

        if sea_area and time and water_quality and water_temp and salinity:
            try:
                sea_area = int(sea_area)

                # 打印调试信息
                logger.debug(f"Converting sea_area to integer: {sea_area}")

                # 检查是否已存在该海域的数据
                with connection.cursor() as cursor:
                    cursor.execute("""
                        SELECT COUNT(*)
                        FROM environment_data
                        WHERE marine = %s
                    """, [sea_area])
                    result = cursor.fetchone()

                logger.debug(f"Database query result for existing sea_area: {result[0]}")

                if result[0] > 0:
                    # 更新数据
                    with connection.cursor() as cursor:
                        cursor.execute("""
                            UPDATE environment_data
                            SET ID=%s,collection_time = %s, water_quality = %s, water_temperature = %s, salinity = %s
                            WHERE marine = %s
                        """, [sea_area,time, water_quality, water_temp, salinity, sea_area])
                    logger.debug(f"Updated data for sea_area {sea_area}")
                else:
                    # 新增数据
                    with connection.cursor() as cursor:
                        cursor.execute("""
                            INSERT INTO environment_data (ID,marine, collection_time, water_quality, water_temperature, salinity)
                            VALUES (%s,%s, %s, %s, %s, %s)
                        """, [sea_area,sea_area, time, water_quality, water_temp, salinity])
                    logger.debug(f"Inserted new data for sea_area {sea_area}")

                return redirect('/marine_environment/')  # 跳转到成功页面
            except ValueError:
                time = "0"
                water_quality = "输入错误"
                water_temp = "输入错误"
                salinity = "输入错误"

        else:
            logger.warning("Some fields are missing!")
            return render(request, 'maintain_en.html', {'message': "所有字段不能为空"})

    logger.debug("Redirecting to marine_environment")
    return redirect('marine_environment')  # 默认跳转到首页

def search_sort(request):
    time = None
    sorts = None
    nums = None

    if request.method == 'POST':
        sea_area = request.POST.get('sea_area')  # 获取用户输入的海域编号
        print(f"用户输入的海域编号: {sea_area}")  # 打印用户输入的海域编号
        
        try:
            sea_area = int(sea_area)  # 转换为整数
            
            # 使用 raw SQL 查询数据库
            with connection.cursor() as cursor:
                print(f"执行 SQL 查询，查询海域编号为: {sea_area}")  # 打印执行查询的海域编号
                
                cursor.execute("""
                    SELECT collection_time, types, quantities
                    FROM fishery_resource
                    WHERE marine = %s
                """, [sea_area])
                result = cursor.fetchone()
                
                print(f"查询结果: {result}")  # 打印查询结果

                if result:
                    time,sorts,nums = result
                else:
                    time = "未找到相关数据"
                    sorts = "未找到相关数据"
                    nums = "未找到相关数据"
        except ValueError:
            time = "输入错误"
            sorts = "输入错误"
            nums = "输入错误"
        except Exception as e:
            time = "查询错误"
            sorts = "查询错误"
            nums = "查询错误"
            print(f"错误信息: {str(e)}")  # 打印错误信息

    return render(request, 'fishing_resources1.html', {
        'time': time,
        'sorts': sorts,
        'nums': nums
    })

def sort(request):
    return render(request, 'fishing_resources2.html', locals())


# 配置日志记录
logger = logging.getLogger(__name__)

def maintain_sort(request):
    if request.method == 'POST':
        sea_area = request.POST.get('sea_area')
        time = request.POST.get('time')
        sorts = request.POST.get('sorts')
        nums = request.POST.get('nums')

        if sea_area and time and sorts and nums:
            try:
                sea_area = int(sea_area)

                # 检查是否已存在该海域的数据
                with connection.cursor() as cursor:
                    cursor.execute("""
                        SELECT COUNT(*)
                        FROM fishery_resource
                        WHERE marine = %s
                    """, [sea_area])
                    result = cursor.fetchone()

                logger.debug(f"Database query result for existing sea_area: {result[0]}")

                if result[0] > 0:
                    # 更新数据
                    with connection.cursor() as cursor:
                        cursor.execute("""
                            UPDATE fishery_resource
                            SET ID=%s,collection_time = %s, types = %s, quantities = %s
                            WHERE marine = %s
                        """, [sea_area,time, sorts,nums, sea_area])
                    logger.debug(f"Updated data for sea_area {sea_area}")
                else:
                    # 新增数据
                    with connection.cursor() as cursor:
                        cursor.execute("""
                            INSERT INTO fishery_resource (ID,marine, collection_time, types, quantities)
                            VALUES (%s,%s, %s, %s, %s)
                        """, [sea_area,sea_area,time, sorts,nums])
                    logger.debug(f"Inserted new data for sea_area {sea_area}")

                return redirect('/fishing_resources/')  # 跳转到成功页面
            except ValueError:
                time = "0"
                sorts = "输入错误"
                nums = "输入错误"

        else:
            logger.warning("Some fields are missing!")
            return render(request, 'fishing_resources2.html', {'message': "所有字段不能为空"})

    logger.debug("Redirecting to marine_environment")
    return redirect('/fishing_resources/')  # 默认跳转到首页

def search_acti(request):
    time = None
    actis = None

    if request.method == 'POST':
        sea_area = request.POST.get('sea_area')  # 获取用户输入的海域编号
        print(f"用户输入的海域编号: {sea_area}")  # 打印用户输入的海域编号
        
        try:
            sea_area = int(sea_area)  # 转换为整数
            
            # 使用 raw SQL 查询数据库
            with connection.cursor() as cursor:
                print(f"执行 SQL 查询，查询海域编号为: {sea_area}")  # 打印执行查询的海域编号
                
                cursor.execute("""
                    SELECT ID
                    FROM fishery_activity
                    WHERE marine = %s
                """, [sea_area])
                result = cursor.fetchone()
                
                print(f"查询结果: {result}")  # 打印查询结果

                if result:
                    actis = result
                else:
                    actis = "未找到相关数据"
        except ValueError:
            actis = "输入错误"
        except Exception as e:
            actis = "查询错误"
            print(f"错误信息: {str(e)}")  # 打印错误信息

    return render(request, 'fishing_activities1.html', {
        'actis': actis,
    })

def acti(request):
    return render(request, 'fishing_activities2.html', locals())


# 配置日志记录
logger = logging.getLogger(__name__)

def maintain_acti(request):
    if request.method == 'POST':
        sea_area = request.POST.get('sea_area')
        actis = request.POST.get('actis')

        if sea_area and actis:
            try:
                sea_area = int(sea_area)

                # 检查是否已存在该海域的数据
                with connection.cursor() as cursor:
                    cursor.execute("""
                        SELECT COUNT(*)
                        FROM fishery_activity
                        WHERE marine = %s
                    """, [sea_area])
                    result = cursor.fetchone()

                logger.debug(f"Database query result for existing sea_area: {result[0]}")

                if result[0] > 0:
                    # 更新数据
                    with connection.cursor() as cursor:
                        cursor.execute("""
                            UPDATE fishery_activity
                            SET ID=%s
                            WHERE marine = %s
                        """, [actis, sea_area])
                    logger.debug(f"Updated data for sea_area {sea_area}")
                else:
                    # 新增数据
                    with connection.cursor() as cursor:
                        cursor.execute("""
                            INSERT INTO fishery_activity (ID,marine, environment_data, fishery_resource)
                            VALUES (%s,%s, %s, %s)
                        """, [actis,sea_area,1001, 1001])
                    logger.debug(f"Inserted new data for sea_area {sea_area}")

                return redirect('/fishing_activities/')  # 跳转到成功页面
            except ValueError:
                time = "0"
                sorts = "输入错误"
                nums = "输入错误"

        else:
            logger.warning("Some fields are missing!")
            return render(request, 'fishing_resources2.html', {'message': "所有字段不能为空"})

    logger.debug("Redirecting to marine_environment")
    return redirect('/fishing_activities/')  # 默认跳转到首页


def policies(request):
    if request.method == 'POST':
        comment = request.POST.get('comment')

        if comment:
            try:
                with connection.cursor() as cursor:
                    cursor.execute("""
                        INSERT INTO policy (ID,responsible_person, announcement_content, time_period)
                        VALUES (%s,%s, %s, %s)
                    """, [2,4,comment,100])

                return redirect('/policies/')  # 跳转到成功页面
            except ValueError:
                comment = "0"

        else:
            logger.warning("Some fields are missing!")
            return render(request, 'policies.html', {'message': "所有字段不能为空"})

    logger.debug("Redirecting to marine_environment")
    return redirect('/policies/')  # 默认跳转到首页

def recom(request):
    if request.method == 'POST':
        comment = request.POST.get('comment')

        if comment:
            try:
                with connection.cursor() as cursor:
                    cursor.execute("""
                        INSERT INTO suggestion (ID,submitter,suggested_content,approver)
                        VALUES (%s,%s, %s, %s)
                    """, [2,2,comment,4])

                return redirect('/recommendations/')  # 跳转到成功页面
            except ValueError:
                comment = "0"

        else:
            logger.warning("Some fields are missing!")
            return render(request, 'recommendations.html', {'message': "所有字段不能为空"})

    logger.debug("Redirecting to marine_environment")
    return redirect('/recommendations/')  # 默认跳转到首页