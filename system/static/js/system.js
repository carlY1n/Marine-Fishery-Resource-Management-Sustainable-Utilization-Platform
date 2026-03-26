function redirectToMain() {
    window.location.href = "{% url 'main' %}";
}

function redirectToLogin() {
    window.location.href = "{% url 'login' %}";
}

function redirectToFishingActivities() {
    window.location.href = "{% url 'fishing_activities' %}";
}

function redirectToFishingResources() {
    window.location.href = "{% url 'fishing_resources' %}";
}

function redirectToMar_envir() {
    window.location.href = "{% url 'marine_environment' %}";
}

function redirectToPolicies() {
    window.location.href = "{% url 'policies' %}";
}

function redirectToProfile() {
    window.location.href = "{% url 'profile' %}";
}

function redirectToRecom() {
    window.location.href = "{% url 'recommendations' %}";
}

function redirectToRegister() {
    window.location.href = "{% url 'register' %}";
}

function selectOption(selectElement) {
    const selectedValue = selectElement.value;
    alert('已选择: ' + selectedValue);
    // 隐藏选择框
    document.querySelector('.dropdown').style.display = 'none';
}