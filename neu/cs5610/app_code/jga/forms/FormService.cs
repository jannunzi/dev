using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for FormService
/// </summary>

namespace edu.neu.ccis.jga.forms
{
    public class FormService
    {
        public FormService()
        {
        }

        List<Form> forms { set; get; }

        public void addForm(Form form)
        {
            forms.Add(form);
        }

        public static Form getFormByName(String formName)
        {
            Form form = Form.getRandomForm(formName, 20, 10);
            /*
            for (int i = 0; i < 10; i++)
            {
                Row row = Row.getRandomRow(10);
                form.rows.Add(row);
            }
             */
            return form;
        }
    }
}