using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace edu.neu.ccis.jga.forms
{

    public class Row
    {
        public Row(List<Object> data)
        {
            if (data == null)
                this.columns = new List<Object>();
            else
                this.columns = data;
        }

        public List<Object> columns { set; get; }

        static Random random = new Random();
        public static Row getRandomRow(int cols)
        {
            List<Object> data = new List<Object>(cols);
            for (int i = 0; i < cols; i++)
            {
                int randomNumber = random.Next(0, 100);
                data.Add(randomNumber);
            }
            Row row = new Row(data);
            return row;
        }
    }
}