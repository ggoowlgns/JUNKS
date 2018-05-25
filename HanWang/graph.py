x = 3
print(x)

import matplotlib.pyplot as plt
import csv
import collections

x_start_time = 8 #시
x_end_time = 13 #시
########엑셀 파일 관련 ########
def get_data(file):
    #엑셀 파일 열기
    f = open(file,"r" , encoding='utf-8')
    rdr = csv.reader(f)
    di = {}
    for line in rdr:
        di[line[1]] = line[2]
    del di['human_readable_date'] #첫행 지워줌 (각 열 설명)
    f.close()

    time = []
    value = list(di.values())
    value.reverse()
    time_temp = list(di.keys())
    time_temp.reverse()

    for x in time_temp:
        temp = x.split()[1].split("+")[0].split(":")    #시:분 만 가져온다.
        time.append(x.split()[0] +" " +temp[0]+":"+temp[1])

    #요일 별로 뽑기
    di = list(zip(time,value))
    set_time=set(time)
    res = {}
    for s in set_time:
        count = 0
        val = 0
        for d in di:
            if d[0] == s:
                val += float(d[1])
                count += 1
        if (val/count) > 0.3:           #1분에 몇 퍼센트인지 지정해줌
            res[s] = 1
        else:
            res[s] = 0

    res_sorted = dict(collections.OrderedDict(sorted(res.items())))

    res ={}
    for re in res_sorted.keys():
        hour = str(re).split()[1].split(":")[0]
        if ((int(hour) >= x_start_time) & (int(hour) <= x_end_time)):   #지정된 시간으로 domain 설정
            res[re] = res_sorted[re]

    return list(res.keys()),list(res.values())

def separate_date(date,value):
    new_date = []
    for d in date:
        new_date.append(d.split())
    li = list(zip(new_date,value))

    #####날짜 추출#####
    day = []
    for d in li:
        day.append(d[0][0])
    day = set(day)

    for d in list(day):
        res = []
        for i in li:
            if i[0][0] == d:
                res.append([i[0][1],i[1]])
        date = []
        value = []
        for re in res:
            date.append(re[0])
            value.append(re[1])
        yield d, date,value

def bit_to_people(dict_mot1,dict_mot2,dict_mot3,dict_mot4):
    final_date, final_value = [], []

    for day in list(dict_mot1.keys()):
        if ((day in list(dict_mot2)) and (day in list(dict_mot3) and (day in list(dict_mot4)))):
            bit_1 = dict_mot1[day]
            bit_2 = dict_mot2[day]
            bit_3 = dict_mot3[day]
            bit_4 = dict_mot4[day]

            bit_res = bit_1*(2**3) + bit_2*(2**2) + bit_3*(2**1) + bit_4*(2**0)
            number_of_people = bit_func(bit_res)

            final_date.append(day)
            final_value.append(number_of_people)

    return final_date,final_value

def bit_func(bit_res):
    return {0:0,
            1:0,
            2:0,
            3:0,
            4:0,
            5:0,
            6:0,
            7:50,
            8:10,
            9:10,
            10:10,
            11:50,
            12:20,
            13:20,
            14:35,
            15:50
            }.get(bit_res, 0)



if __name__ == '__main__':
    date_1 , value_1 =get_data("C:/Users/JiHoon\Desktop/JH\HanWang_CabStone/data/values_motion1_uil55.csv") #10명
    date_2, value_2 = get_data("C:/Users/JiHoon/Desktop/JH/HanWang_CabStone/data/values_motion2_i0en0.csv") #20명
    date_3, value_3 = get_data("C:/Users/JiHoon/Desktop/JH/HanWang_CabStone/data/values_motion3_mkv47.csv") #35명
    date_4, value_4 = get_data("C:/Users/JiHoon/Desktop/JH/HanWang_CabStone/data/values_motion4_zwi2d.csv") #50명

    final_date, final_value = bit_to_people(dict(zip(date_1,value_1)),dict(zip(date_2,value_2)),dict(zip(date_3,value_3)),dict(zip(date_4,value_4)))

    # Make regular histogram
    fig, ax = plt.subplots(nrows=1, ncols=1, figsize=[30, 5])

    value_of_dates = []
    for d, date, value in separate_date(final_date, final_value):
        value_of_dates.append([d, date, value])

    value_of_dates.sort(key = lambda  x:x[0])
    color = ["black", "red", "blue", "yellow", "khaki", "orange", "purple"]
    i = 0

    #draw graph
    for va in value_of_dates:
        ax.plot(va[1], va[2], color=color[i], lw=1, label=va[0])
        i+=1

    # Annotate diagram
    ax.set_ylabel("Number of People") #x축 , y축 좌표축 항목 명시
    ax.set_xlabel("Time(minutes)")

    # Draw legend
    plt.legend()
    plt.show()