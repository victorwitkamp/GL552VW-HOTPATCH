DefinitionBlock("", "SSDT", 2, "hack", "smbus", 0)
{
    Scope (_SB.PCI0.HDAS)
    {
        Device (BUS0)
        {
            Name (_CID, "smbus")
            Name (_ADR, Zero)
            Device (DVL0)
            {
                Name (_ADR, 0x57)
                Name (_CID, "diagsvault")
                Method (_DSM, 4, NotSerialized)
                {
                    If (LEqual (Arg2, Zero)) { Return (Buffer() { 0x03 } ) }
                    Return (Package() { "address", 0x57 })
                }
            }
        }
    }
}

