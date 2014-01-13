using System;

namespace edu.neu.ccis.jga
{
    public class Person
    {
        public Person() { }

        public Person(string fn, string ln, DateTime dob)
        {
            this.first = fn;
            this.last = ln;
            this.dob = dob;
        }

        public string first { set; get; }
        public string last { set; get; }
        public DateTime dob { set; get; }
    }
}