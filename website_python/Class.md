# 类

## 示例1


```python
class GOOD_INFO():
    def __init__(self,name,unit,price):
        self.name=name
        self.unit=unit
        self.price=price

    def tag(self,category):
        self.name=input('Please input the name:')
        self.unit=input('Please input the unit:')
        self.price=input('Please input the price per unit (￥):')
        category[self.name]='￥'+self.price+' per '+self.unit

    def print_list(self,category):
        #print('name , price per unit')
        print(category)

    def delete(self,category):
        a=input('Please input the name:')
        for names in category.keys():
            if a is names:
                del category[a]
                print('Process completed')
                break
            if a is category[-1]:
                print('Not found')
```

## 示例2


```python
class student():
    def __init__(self,name,grade,gender,status):
        self.name=name
        self.grade=grade
        self.gender=gender
        self.status=status

    def stu_print(self):
        print(self.name+' is a grade '+str(self.grade)+' student.')
        if self.gender is 'male':
            print('He',end=' ')
        elif self.gender is 'female':
            print('She',end=' ')
        else:
            print('He/She',end=' ')
        if self.status is True:
            print('is present.')
        else:
            print('is absent.')

    def present(self):
        print(self.name.title()+' is present.')
        self.status=True

    def absent(self):
        print(self.name.title()+' is absent.')
        print('Where is',end=' ')
        if self.gender is 'male':
            print('he?')
        elif self.gender is 'female':
            print('she?')
        else:
            print('he/she?')
        self.status=False

Sam=student('Sam',5,'male',True)
student.stu_print(Sam)
student.absent(Sam)
```

## 示例3


```python
class Phone():

    def __init__(self,brand,model,os,osver):
        self.brand=brand
        self.model=model
        self.os=os
        self.osver=osver

    def output(self):
        print('This phone is '+self.brand.upper()+' '+self.model+'.')
        print('Its OS is '+self.os.upper()+' '+str(self.osver)+'.')

    def update(self,newver):
        if(newver>=self.osver):
            self.osver=newver
            print('This phone has updated to '+self.os.upper()+' '+str(self.osver)+'.')
        else:
            print('Error.You can not degrade your phone!')


mine=Phone('Huawei','P20','android',9.0)
Phone.output(mine)

Phone.update(mine,8.0)
Phone.update(mine,10.0)
Phone.output(mine)

class Good_Phone(Phone):
    def __init__(self,brand,model,os,osver,stars):
        super().__init__(brand,model,os,osver)
        self.stars=stars

    def comment(self):
        x=-1
        while (x>5 or x<0):
            x=int(input('Please input how many star(s) you may give (5 is best):'))
            if(x>=0 and x<=5):
                self.stars=x
                print('You have given the phone '+str(self.stars),end=' ')
                if(x>=0 and x<=0):
                    print('star.')
                else:
                    print('stars.')
            else:
                print('You have input a number that is not proper.')

mine=Good_Phone('Huawei','P20','android',9.0,0)
mine.output()
mine.comment()
```

[返回上一页](python.md)