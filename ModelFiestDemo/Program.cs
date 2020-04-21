using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ModelFiestDemo
{
    class Program
    {
        static void Main(string[] args)
        {
            DataModelContainer dbContext = new DataModelContainer();



            //#region MyRegion  新增
            //Customer customer = new Customer();
            //customer.CusName = "yang";
            //dbContext.Customer.Add(customer);

            //dbContext.SaveChanges();



            //#endregion


            #region 修改

            Customer customer1 = new Customer();

            customer1.CusName = "杨过";
            customer1.Id = 1;

            //3.告诉ef对上面的实体进行一个修改操作

            //dbContext.Entry<student>(stu).State = System.Data.Entity.EntityState.Modified;//实体全部修改
            dbContext.Customer.Attach(customer1);//附加到上下文来管理

            dbContext.Entry<Customer>(customer1).Property<string>(u => u.CusName).IsModified = true;
         

            //4.告诉上下文，把实体的变化保存到数据库

            dbContext.SaveChanges();


            //ceshizuixing 

            //master看不到



            #endregion
        }
    }
}
