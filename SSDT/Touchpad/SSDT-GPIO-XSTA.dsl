 DefinitionBlock ("", "SSDT", 2, "hack", "GPI0ALT", 0)
 {
    External(_SB.PCI0.GPI0, DeviceObj)
    
    Scope (_SB.PCI0.GPI0)
    {
        Method (_STA, 0, NotSerialized)  // _STA: Status
        {
            Return (0x0F)
        }
    }
}