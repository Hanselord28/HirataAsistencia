/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import org.apache.pdfbox.pdmodel.*;
import org.apache.pdfbox.pdmodel.font.PDType0Font;
import org.apache.pdfbox.pdmodel.common.PDRectangle;

public class ReporteAsistenciaPDF {

    private String rutaFuente = "C:\\Users\\lvved\\OneDrive\\Documentos\\NetBeansProjects\\clase11\\iN\\src\\res\\Roboto-Regular.ttf";

    public void generarReporte(List<Asistencia> lista, String titulo) {
        try {
            // Carpeta en Descargas
            String rutaCarpeta = System.getProperty("user.home") + "\\Downloads\\Reportes";
            File carpeta = new File(rutaCarpeta);
            if (!carpeta.exists()) carpeta.mkdirs();

            // Nombre único para no sobrescribir
            String timestamp = new SimpleDateFormat("yyyy-MM-dd_HH-mm-ss").format(new Date());
            String rutaArchivo = rutaCarpeta + "\\" + titulo.replace(" ", "_") + "_" + timestamp + ".pdf";

            try (PDDocument document = new PDDocument()) {
                PDPage page = new PDPage(new PDRectangle(PDRectangle.A3.getHeight(), PDRectangle.A3.getWidth()));
                document.addPage(page);
                PDPageContentStream content = new PDPageContentStream(document, page);

                PDType0Font font = PDType0Font.load(document, new File(rutaFuente));

                float margin = 50;
                float tableWidth = page.getMediaBox().getWidth() - 2 * margin;
                float yStart = page.getMediaBox().getHeight() - 80;
                float rowHeight = 30;
                float cellMargin = 14;

                // Título
                content.setFont(font, 18);
                content.beginText();
                content.newLineAtOffset(margin, yStart);
                content.showText(titulo);
                content.endText();
                yStart -= 50;

                // Encabezado con fondo resaltado
                content.setNonStrokingColor(180/255f, 210/255f, 250/255f);
                content.addRect(margin, yStart, tableWidth, rowHeight);
                content.fill();
                content.setNonStrokingColor(0f);

                String[] headers = {"ID", "Usuario", "Fecha", "Entrada", "Salida"};
                float[] columnWidths = {0.1f, 0.2f, 0.2f, 0.25f, 0.25f};
                float xPosition = margin;
                for (int i = 0; i < headers.length; i++) {
                    content.setFont(font, 12);
                    content.beginText();
                    content.newLineAtOffset(xPosition + cellMargin, yStart + 10);
                    content.showText(headers[i]);
                    content.endText();
                    xPosition += tableWidth * columnWidths[i];
                }
                yStart -= rowHeight;

                // Filas de datos
                for (Asistencia a : lista) {
                    xPosition = margin;
                    float rowStartY = yStart;

                    String[] datos = {
                        String.valueOf(a.getIdAsistencia()),
                        String.valueOf(a.getIdUsuario()),
                        a.getFecha().toString(),
                        a.getHoraEntrada() != null ? a.getHoraEntrada().toString() : "-",
                        a.getHoraSalida() != null ? a.getHoraSalida().toString() : "-"
                    };

                    for (int i = 0; i < datos.length; i++) {
                        float cellWidth = tableWidth * columnWidths[i];

                        // Fondo blanco
                        content.setNonStrokingColor(1f);
                        content.addRect(xPosition, rowStartY - rowHeight, cellWidth, rowHeight);
                        content.fill();
                        content.setNonStrokingColor(0f);

                        // Texto
                        content.setFont(font, 12);
                        content.beginText();
                        content.newLineAtOffset(xPosition + cellMargin, rowStartY - rowHeight + 10);
                        content.showText(datos[i]);
                        content.endText();

                        // Bordes
                        content.setLineWidth(1f);
                        content.addRect(xPosition, rowStartY - rowHeight, cellWidth, rowHeight);
                        content.stroke();

                        xPosition += cellWidth;
                    }

                    yStart -= rowHeight;

                    // Salto de página
                    if (yStart < margin) {
                        content.close();
                        page = new PDPage(new PDRectangle(PDRectangle.A3.getHeight(), PDRectangle.A3.getWidth()));
                        document.addPage(page);
                        content = new PDPageContentStream(document, page);
                        yStart = page.getMediaBox().getHeight() - margin;
                    }
                }

                content.close();
                document.save(rutaArchivo);
                System.out.println("📄 PDF generado correctamente en: " + rutaArchivo);
            }

        } catch (IOException ex) {
            ex.printStackTrace();
        }
    }
}
