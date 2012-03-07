# Chronomize

A simple tool for navigating relative to a date, with knowledge about how current that date is.

## Usage

Navigation surrounding today's date.

    navigation = Chronomize.new(Date.today)

    navigation.previous
    => 'yesterday'

    navigation.current
    => 'today'

    navigation.next
    => 'tomorrow'

Navigation with a different date selected.

    navigation = Chronomize.new(Date.yesterday)

    navigation.previous
    => 'March 5, 2012'

    navigation.current
    => 'yesterday'

    navigation.next
    => 'today'

### Day names

    navigation = Chronomize.new(Date.today, :today => 'aujourd\'hui', :yesterday => 'hier', :tomorrow => 'demain')

### Add symbols to accentuate previous / next

    navigation = Chronomize.new(Date.today, :previous => '<', :next => '>')

    navigation.previous
    => '< yesterday'

    navigation.current
    => 'today'

    navigation.next
    => 'tomorrow >'

### Change date format

Use any valid strftime format.

    navigation = Chronomize.new(Date.today - 3, :date_format => '%-d.%-m.%Y')

    navigation.previous
    => '3.3.2012'

    navigation.current
    => '4.3.2012'

    navigation.next
    => '5.3.2012'

### I18n

Set defaults in your locale file, e.g.:

    # fr.yml
    chronomize:
      yesterday: hier
      today: aujourd'hui
      tomorrow: demain
      previous: &laquo;
      next: &raquoe;

