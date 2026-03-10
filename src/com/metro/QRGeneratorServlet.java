package com.metro;

import java.io.IOException;
import java.io.OutputStream;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.WriterException;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.qrcode.QRCodeWriter;
import com.google.zxing.client.j2se.MatrixToImageWriter;

@WebServlet("/QRGeneratorServlet")
public class QRGeneratorServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws IOException {

        String cardNumber = request.getParameter("cardNumber");

        if (cardNumber == null || cardNumber.isEmpty()) {
            response.getWriter().println("Invalid Card Number");
            return;
        }

        try {
            QRCodeWriter qrCodeWriter = new QRCodeWriter();

            BitMatrix bitMatrix = qrCodeWriter.encode(
                    cardNumber,
                    BarcodeFormat.QR_CODE,
                    300,
                    300
            );

            response.setContentType("image/png");

            OutputStream os = response.getOutputStream();

            MatrixToImageWriter.writeToStream(bitMatrix, "PNG", os);

            os.flush();
            os.close();

        } catch (WriterException e) {
            e.printStackTrace();
        }
    }
}