package me.whiteship.refactoring._06_mutable_data._19_separate_query_from_modifier;

import org.junit.jupiter.api.Test;

import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

class CriminalTest {

    @Test
    void alertForMiscreant() {
        Criminal criminal = new Criminal();
        Person found = criminal.findMiscreant(List.of(new Person("Keesun"), new Person("Don")));
        criminal.alertForMiscreant(found);
        assertEquals("Don", found.getName());

        found = criminal.findMiscreant(List.of(new Person("John"), new Person("Don")));
        assertEquals("John", found.getName());

        found = criminal.findMiscreant(List.of(new Person("mks1"), new Person("mks2")));
        assertEquals("", found.getName());
    }

}