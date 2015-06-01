from django.shortcuts import render_to_response
from jsite.static_vars import profile_list


def grass(request):
    return render_to_response(
        'lab/grass.html',
        {'profile_list': profile_list, }
    )
