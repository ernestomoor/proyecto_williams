/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Security;

/**
 *
 * @author Wolf
 */
public class Validaciones {

    public boolean longitud(int valido, String text) {

        if (text.length() == valido) {
            return true;
        } else {
            return false;
        }
    }

    public boolean lminima(int valido, String text) {

        if (text.length() >= valido) {
            return true;
        } else {
            return false;
        }
    }

    public boolean lmaxima(int valido, String text) {

        if (text.length() <= valido) {
            return true;
        } else {
            return false;
        }
    }

    public boolean numeros(String numero) {

        try {
            Integer.parseInt(numero);
            return true;
        } catch (Exception ex) {
            return false;
        }
    }

    public boolean sonLetras(String texto) {
        return texto.matches("([a-z]|[A-Z]|[ñ]|[á, é, í, ó, ú]\\s)+");
    }

    public boolean LetNum(String texto) {
        return texto.matches("([a-z]|[A-Z]|[ñ]|[0]\\s)+");
    }

    public boolean NumMin(String texto, int numero) {
        if (numeros(texto)) {
            if (Integer.parseInt(texto) > numero) {
                return true;
            } else {
                return false;
            }
        } else {
            return false;
        }
    }

    public boolean NumMax(String texto, int numero) {
        if (numeros(texto)) {
            if (Integer.parseInt(texto) < numero) {
                return true;
            } else {
                return false;
            }
        } else {
            return false;
        }
    }
    public static void main(String[] args) {
        Validaciones val=new Validaciones();
        System.out.println(val.LetNum("abcdefghijklmnñopqrstuvwxyññ0"));
    }
}
