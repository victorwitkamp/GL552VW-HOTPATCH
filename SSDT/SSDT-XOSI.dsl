DefinitionBlock ("", "SSDT", 2, "hack", "_XOSI", 0)
{
    Method (XOSI, 1, NotSerialized)
    {
        If (_OSI ("Darwin"))
        {
            If (LEqual (Arg0, "Windows 2015"))
            {
                Return (0xFFFFFFFF)
            }
            Else
            {
                Return (Zero)
            }
        }
        Else
        {
            Return (_OSI (Arg0))
        }
    }
}