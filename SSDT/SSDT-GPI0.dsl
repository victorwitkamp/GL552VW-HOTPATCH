DefinitionBlock ("", "SSDT", 2, "hack", "GPI0", 0)
{
    External(GPEN, FieldUnitObj)

    Scope (\)
    {
        If (_OSI ("Darwin"))
        {
            GPEN = 1
        }
    }
}