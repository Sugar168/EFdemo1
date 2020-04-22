using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EFdemo
{
    class Program
    {
        static void Main(string[] args)
        {
            //1.声明上下文

            FirstDbEntities dbContext = new FirstDbEntities();

            #region 新增操作



            //2.声明一个学生实体；

            //student stu = new student();

            //stu.Sid = "0005";
            //stu.Sname = "天猫";
            //stu.Ssex = "男";
            //stu.Sbirthdate = DateTime.Now.Date;

            ////3.告诉ef对上面的实体进行一个插入操作

            //dbContext.student.Add(stu);

            ////4.告诉上下文，把实体的变化保存到数据库

            //dbContext.SaveChanges();
            #endregion

            #region 修改操作

            ////1.声明上下文


            ////2.声明一个学生实体；

            //student stu = new student();

            //stu.Sid = "0005";//修改删除的时候 指定ID
            //stu.Sname = "马天猫";
            //stu.Ssex = "男";
            //stu.Sbirthdate = DateTime.Now.Date;

            ////3.告诉ef对上面的实体进行一个修改操作

            ////dbContext.Entry<student>(stu).State = System.Data.Entity.EntityState.Modified;//实体全部修改
            //dbContext.student.Attach(stu);//附加到上下文来管理

            //dbContext.Entry<student>(stu).Property<string>(u => u.Sname).IsModified = true;//只修改某个列

            ////4.告诉上下文，把实体的变化保存到数据库

            //dbContext.SaveChanges();

            #endregion

            #region 查询操作


            //1.把学生表所有数据打出来

            //foreach (var item in dbContext.student)
            //{
            //    Console.WriteLine(item.Sid +" " +item.Sname);
            //}

            ////单独查询性别为男的 linq查询

            //var temp = from u in dbContext.student

            //           where u.Ssex == "男"

            //           select u;

            //var str = from it in dbContext.student

            //          where it.Sname.Contains("子")

            //          select it;

            //foreach (var item in temp)
            //{
            //    Console.WriteLine(item.Sid + " " + item.Sname + " " + item.Ssex);
            //}

            //foreach (var item in str)
            //{
            //    Console.WriteLine(item.Sid + " " + item.Sname + " " + item.Ssex);
            //}


            List<int> list = new List<int>() {1,2,3 };

            //List<object> listObj = list;

            //foreach (var item in listObj)
            //{

            //}

            IQueryable<student> stu = from u in dbContext.student
                                      where u.Ssex == "女"
                                      select u;

            IQueryable<object> parent = stu;


            //协变 。 把一个子类的泛型集合赋值给父类的泛型集合，外边用的时候 用父类泛型；


            #region 协变，逆变
            Func<int, bool> delFunc;

            Func<object, bool> delParent = a =>
            {
                Console.WriteLine(a.ToString());
                return true;
            };

            #endregion



            //逆变  还是为了安全，把父类的泛型给子类的泛型对象

            #endregion


            #region 

            #endregion



            Console.ReadKey();

            //在分支里面修改东西，然后master应该是看不到


            //今天再次从分支添加




            //今天22号，我先推送到分支，mster看不到


        }
    }
}
