# NAME

Mojo::Log::Role::Color - Add colors to your mojo logs

# SYNOPSIS

    use Mojo::Log;
    my $log = Mojo::Log->with_roles("+Color")->new;
    $log->info("FYI: it happened again");

# DESCRIPTION

[Mojo::Log::Role::Color](https://metacpan.org/pod/Mojo%3A%3ALog%3A%3ARole%3A%3AColor) is a role you can apply to your [Mojo::Log](https://metacpan.org/pod/Mojo%3A%3ALog) to get
colored log messages when running your application in interactive mode.

It is also possible to set the `MOJO_LOG_COLORS` environment variable to force
colored output.

The coloring is based on the log level:

    debug: cyan text
    info:  green text
    warn:  yellow text
    error: red text
    fatal: white text on red background

The colors can be customized by changing `%Mojo::Log::Role::Color::COLORS`,
though this is not officially supported, and may break in a future release.

# ATTRIBUTES

## colored

    $bool = $log->colored;
    $log = $log->colored(1);

Check if colored output is enabled, or force it to a given state.  Defaults to
`MOJO_LOG_COLORS` environment variable, or will be set to "1" if
["handle" in Mojo::Log](https://metacpan.org/pod/Mojo%3A%3ALog#handle) is attached to a terminal.

# AUTHOR

Jan Henning Thorsen

# COPYRIGHT AND LICENSE

Copyright (C) Jan Henning Thorsen

This program is free software, you can redistribute it and/or modify it under
the terms of the Artistic License version 2.0.

# SEE ALSO

[Mojo::Log](https://metacpan.org/pod/Mojo%3A%3ALog).
