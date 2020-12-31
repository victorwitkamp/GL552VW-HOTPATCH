DefinitionBlock ("", "SSDT", 2, "hack", "HPETALT", 0)
{
    //External (HPAE, IntObj)
    External (HPTE, IntObj)
    Scope (\)
    {
        If (_OSI ("Darwin"))
        {
            //HPAE =0
            HPTE =0
        }
    }

    Method (_CRS, 0, NotSerialized)
    {
        Return (BUF0)
    }
}
