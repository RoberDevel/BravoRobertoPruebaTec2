/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.trabajos.gestionturnos.logic.validation;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 *
 * @author rober
 */
public class DataValidation {

    public static boolean esCadenaVacia(String opcion) {
        if (!opcion.isEmpty()) {

            return false;
        } else {
            return true;
        }
    }

    public static boolean esCadenaSinNumero(String opcion) {

        String patron = "^[^0-9]*$";
        Pattern pattern = Pattern.compile(patron);
        Matcher matcher = pattern.matcher(opcion);

        if (matcher.matches()) {

            return true;
        } else {
            return false;
        }
    }

}
