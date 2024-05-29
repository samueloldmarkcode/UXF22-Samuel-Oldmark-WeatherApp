### Sammanfattning

I detta projekt har jag strävat efter att skapa en väderapplikation med en enkel och ren design, med ett starkt fokus på användarvänlighet och tillgänglighet. Min intention var att säkerställa att appen är lätt att använda för alla användare, inklusive de med funktionsnedsättningar. För att uppnå detta har jag implementerat tekniska lösningar som Dynamic Type och VoiceOver, vilket gör att appens textstorlek kan justeras dynamiskt och att skärmläsare kan läsa upp innehållet på ett begripligt sätt.

Appens gränssnitt har designats i Figma och sedan omvandlats till SwiftUI-kod med hjälp av Figma-pluginet "Figma to Code". Efter att ha genererat grundkoden har jag gjort manuella justeringar för att uppnå den design och funktionalitet jag eftersträvade. En viktig ändring var att byta från expanderande kort i första vyn till att visa detaljerad information i en ny vy, vilket underlättar för VoiceOver-användare.

För att säkerställa tillgänglighet har jag även sett till att alla färgkontraster uppfyller WCAG-standarder. Exempelvis ändrades färgen på korten i den första vyn för att uppnå en tillräckligt hög kontrast mot bakgrunden. Jag har också implementerat custom fonts som följer Dynamic Type, vilket gör att textstorleken kan anpassas utifrån användarens inställningar.

### Relevanta Länkar

Här är en lista med relevanta länkar och dokumentation som jag använt mig av under utvecklingen:

1. [Apple's Human Interface Guidelines](https://developer.apple.com/design/human-interface-guidelines/)
2. [SwiftUI Documentation](https://developer.apple.com/documentation/swiftui/)
3. [VoiceOver Documentation](https://developer.apple.com/accessibility/ios/)
4. [Dynamic Type Documentation](https://developer.apple.com/documentation/uikit/uifont/scaling_fonts_automatically)
5. [WCAG Guidelines](https://www.w3.org/WAI/standards-guidelines/wcag/)
6. [Figma](https://www.figma.com/)
7. [Figma to Code Plugin](https://www.figma.com/community/plugin/733903260248748149/Figma-to-Code-(HTML%2C-Tailwind%2C-Flutter%2C-SwiftUI))
8. [OpenAI's GPT-3](https://www.openai.com/research/gpt-3)

Dessa källor har varit avgörande för att säkerställa att applikationen är både användarvänlig och tillgänglig för alla användare.
