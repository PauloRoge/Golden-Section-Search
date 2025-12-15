function [x_max, f_max] = gss(f, a, b, tol)
    r  = (sqrt(5) - 1) / 2;
    c  = b - r*(b - a);
    d  = a + r*(b - a);
    fc = f(c);
    fd = f(d);

    while abs(b - a) > tol
        if fc < fd % min or max
            a  = c;
            c  = d;
            fc = fd;
            d  = a + r*(b - a);
            fd = f(d);
        else
            b  = d;
            d  = c;
            fd = fc;
            c  = b - r*(b - a);
            fc = f(c);
        end
    end

    if fc > fd
        x_max = c;
        f_max = fc;
    else
        x_max = d;
        f_max = fd;
    end
end
