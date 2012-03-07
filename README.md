# Chronomize

A simple tool for navigating relative to a date, with knowledge about how current that date is.

## Usage

Navigation surrounding today's date.

    navigation = Chronomize.new(Date.today)

    navigation.previous
    => 'March 6, 2012 (yesterday)'

    navigation.current
    => 'March 7, 2012 (today)'

    navigation.next
    => 'March 8, 2012 (tomorrow)'

Navigation with a different date selected.

    navigation = Chronomize.new(Date.yesterday)

    navigation.previous
    => 'March 5, 2012'

    navigation.current
    => 'March 6, 2012 (yesterday)'

    navigation.next
    => 'March 7, 2012 (today)'

### Day names

    navigation = Chronomize.new(Date.today, :today => 'aujourd\'hui', :yesterday => 'hier', :tomorrow => 'demain')

### Add symbols to accentuate previous / next

    navigation = Chronomize.new(Date.today, :previous => '<', :next => '>')

    navigation.previous
    => '< March 6, 2012 (yesterday)'

    navigation.current
    => 'March 7, 2012 (today)'

    navigation.next
    => 'March 8, 2012 (tomorrow) >'

### Change date format

Use any valid strftime format.

    navigation = Chronomize.new(Date.today, :date_format => '%-d.%-m.%Y')

    navigation.previous
    => '6.3.2012 (yesterday)'

    navigation.current
    => '7.3.2012 (today)'

    navigation.next
    => '8.3.2012 (tomorrow)'

