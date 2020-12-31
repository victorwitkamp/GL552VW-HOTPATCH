 DefinitionBlock ("", "SSDT", 2, "hack", "GPI0ALT", 0)
 {
    Scope (_SB.PCI0.GPI0)
    {
        Method (_STA, 0, NotSerialized)  // _STA: Status
        {
            Return (0x0F)
        }
    }
}