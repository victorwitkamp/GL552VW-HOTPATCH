// RENAME _CRS TO XCRS
DefinitionBlock("", "SSDT", 2, "hack", "hpet", 0)
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
