package RI;


/**
* RI/StringSequenceHolder.java .
* Generated by the IDL-to-Java compiler (portable), version "3.2"
* from src/log/java/log_viewer.idl
* Wednesday, October 14, 2009 1:10:41 PM CEST
*/

public final class StringSequenceHolder implements org.omg.CORBA.portable.Streamable
{
  public String value[] = null;

  public StringSequenceHolder ()
  {
  }

  public StringSequenceHolder (String[] initialValue)
  {
    value = initialValue;
  }

  public void _read (org.omg.CORBA.portable.InputStream i)
  {
    value = RI.StringSequenceHelper.read (i);
  }

  public void _write (org.omg.CORBA.portable.OutputStream o)
  {
    RI.StringSequenceHelper.write (o, value);
  }

  public org.omg.CORBA.TypeCode _type ()
  {
    return RI.StringSequenceHelper.type ();
  }

}
