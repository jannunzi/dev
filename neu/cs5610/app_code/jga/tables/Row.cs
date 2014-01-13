using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace edu.neu.ccis.jga.tables
{
    public class Row
    {
        public Row(List<Object> data)
        {
            if (data == null)
                this.data = new List<Object>();
            else
                this.data = data;
        }
        public List<Object> data { set; get; }

        static Random random = new Random();
        public static Row getRandomRow(int cols)
        {
            List<Object> data = new List<Object>(cols);
            for (int i = 0; i < cols; i++)
            {
                int randomNumber = random.Next(0, 100);
                string randomString = Utils.getRandomString(10);
                data.Add(randomString);
            }
            Row row = new Row(data);
            return row;
        }
    }
}