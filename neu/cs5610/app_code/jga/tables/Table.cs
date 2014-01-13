using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace edu.neu.ccis.jga.tables
{
    public class Table
    {
        public Table(string name, List<string> headers, List<Row> rows)
        {
            this.name = name;
            this.headers = headers;
            this.rows = rows;
        }
        public string name { set; get; }
        public List<string> headers { set; get; }
        public List<Row> rows { set; get; }

        public static Table getRandomTable(string name, int rowCount, int colCount)
        {
            List<string> headers = new List<string>(colCount);
            for (int f = 0; f < colCount; f++)
            {
                headers.Add(Utils.getRandomString(10));
            }

            List<Row> rows = new List<Row>(rowCount);
            for (int r = 0; r < rowCount; r++)
            {
                Row row = Row.getRandomRow(colCount);
                rows.Add(row);
            }

            Table table = new Table(name, headers, rows);
            return table;
        }
    }
}