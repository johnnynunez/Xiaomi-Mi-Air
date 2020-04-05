DefinitionBlock ("", "SSDT", 1, "hack", "_ALC255", 0)
{
 External(_SB.PCI0.HDEF, DeviceObj)
 Name(_SB.PCI0.HDEF.RMCF, Package()
 {
     "CodecCommander", Package()
     {
         "Custom Commands", Package()
         {
             Package(){}, // signifies Array instead of Dictionary
             Package()
             {
                 // 0x19 SET_PIN_WIDGET_CONTROL 0x25
                 "Command", Buffer() { 0x01, 0x97, 0x07, 0x25 },
                 "On Init", ">y",
                 "On Sleep", ">n",
                 "On Wake", ">y",
             },
             Package()
             {
                 // 0x21 SET_UNSOLICITED_ENABLE 0x83
                 "Command", Buffer() { 0x02, 0x17, 0x08, 0x83 },
                 "On Init", ">y",
                 "On Sleep", ">n",
                 "On Wake", ">y",
             }
         },
         "Perform Reset", ">n",
         "Perform Reset on External Wake", ">n", // enabled since using AppleALC
         "Send Delay", 10,
         "Sleep Nodes", ">n",
     },
 })
}
//EOF