using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for FormService
/// </summary>

namespace edu.neu.ccis.jga.tables
{
    public class TableService
    {
        public TableService()
        {
        }

        public static List<Table> tables { set; get; }

        public static Table getTableByName(string tableName)
        {
            if (tableName == null)
                tableName = Utils.getRandomString(10);
            Table table = Table.getRandomTable(tableName, 20, 10);
            return table;
        }

    }
}