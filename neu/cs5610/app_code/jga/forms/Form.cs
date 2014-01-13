using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Form
/// </summary>
namespace edu.neu.ccis.jga.forms
{
    public class Form
    {
        public Form() : this(null, null, null) { }
        public Form(string name) : this(name, null, null) { }
        public Form(string name, List<Field> fields) : this(name, fields, null)
        {
        }
        public Form(string name, List<Field> fields, List<Row> rows)
        {
            if (name == null)
                this.name = "";
            else
                this.name = name;

            if (fields == null)
                this.fields = new List<Field>();
            else
                this.fields = fields;

            if (rows == null)
                this.data = new List<Row>();
            else
                this.data = rows;
        }

        public List<Field> fields { set; get; }
        public string name { set; get; }
        public List<Row> data { set; get; }

        public static Form getRandomForm(string name, int rowCount, int colCount) {
            Form form = new Form(name);

            List<Field> fields = new List<Field>(colCount);
            for (int f = 0; f < colCount; f++)
            {
                Field field = Field.getRandomField(null);
                fields.Add(field);
            }
            form.fields = fields;

            List<Row> rows = new List<Row>(rowCount);
            for (int r = 0; r < rowCount; r++)
            {
                Row row = Row.getRandomRow(colCount);
                rows.Add(row);
            }
            form.data = rows;
            return form;
        }
    }
}