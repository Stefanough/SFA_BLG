console.log(
    lScript.reduce((a, b) => {
        return charCount(a) < charCount(b) ? b : a;
    }).ranges.reduce((a, c)
        => a + c.reduce((a, c)
            => c - a), 0));
