package me.whiteship.refactoring._06_mutable_data._19_separate_query_from_modifier;

import java.util.List;

public class Criminal {

    public void alertForMiscreant(Person people) {
        if (people != null) {
            setOffAlarms();
        }
    }

    public Person findMiscreant(List<Person> people) {
        for (Person p : people) {
            if (p.getName().equals("Don")) {
                return p;
            }

            if (p.getName().equals("John")) {
                return p;
            }
        }
        return null;
    }

    private void setOffAlarms() {
        System.out.println("set off alarm");
    }
}
