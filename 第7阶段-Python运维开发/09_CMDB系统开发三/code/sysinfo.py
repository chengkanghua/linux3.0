#coding:utf-8
import psutil
# 版本信息
import platform
import os
import json
import requests
import distro

class GetData(object):

    def __init__(self):
        self.ret = {}
    def get_hostname(self):
        return platform.node()

    def get_cpu_info(self):
        ret = ''
        with open('/proc/cpuinfo') as f:
            for line in f:
                line_list = line.strip().split(':')
                key = line_list[0].strip()
                if key == 'model name':
                    ret = line_list[1]
        return ret.strip()

    def get_cpu_count(self):
        return psutil.cpu_count(logical=False)

    def get_mem_info(self):
        return '%.2f' %(psutil.virtual_memory().total/1024/1024/1024)

    def get_disk_info(self):
        disk_name_list = []
        disk_size_list = []
        disk_name_file = os.popen("lsblk | grep disk | awk '{print $1}'")
        disk_size_file = os.popen("lsblk | grep disk | awk '{print $4}'")
        for disk_name in disk_name_file.readlines():
            disk_name_list.append(disk_name.split()[0])
            for disk_size in disk_size_file.readlines():
                disk_size_list.append(disk_size.split()[0])
        return dict(zip(disk_name_list, disk_size_list))

    def get_ip_info(self):
        ret = {}
        for net_name in psutil.net_if_addrs():
            ret[net_name] = psutil.net_if_addrs()[net_name][0].address
        return ret

    def get_os_system(self):
        #return platform.dist()[0] + ' ' + platform.dist()[1]
        return distro.linux_distribution()[0]+' '+distro.linux_distribution()[1]

    def get_os_system_num(self):
        return platform.architecture()[0].strip('bit')

    def get_uuid(self):
        uuid = os.popen('dmidecode -s system-uuid')
        return uuid.read().strip()

    def get_sn(self):
        sn_popen = os.popen("dmidecode -t 1 | grep 'Serial Number:'")
        sn = sn_popen.read()
        return sn.strip().strip('Serial Number:')

    def send_data(self):
        data_dict = GetData.__dict__
        for key,value in data_dict.items():
            if 'get_' in key:
                key = key.replace('get_', '')
                self.ret[key] = value(self)
        return self.ret

def send_data(url, data):
    response = requests.post(url, data)
    print(response.text)

if __name__ == '__main__':
    getdata = GetData().send_data()
    print(getdata)
    # send_data(url='http://10.10.10.150:8080/resources/server/data_api/', data=json.dumps(getdata))
