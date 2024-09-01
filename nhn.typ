= URL Shorterner Performance
#show math.equation: set text(font: "New Computer Modern Math")
The total cost, $C_n$, of shortening the maximum number of URLs, $n$, is given by:

$
C_n = sum_(k=0)^(n-1) r_(k,n)
$

where $r_(k,n)$ is the cost of finding an available shortened URL at random, when $k$ out of $n$ are unavailable (already taken). Clearly:
$
r_(k,n) = sum_(i=1)^∞ i p_n (i, k)
$
where $p_n (i, k)$ is the probability of finding an available URL on the $i$th attempt when $k$ out of $n$ are already taken.
$
&p_n (1, k) = (n - k)/n \

&p_n (2, k) = (k/n) ((n - k)/n) \

&⋮ \

&p_n (i, k) = (k/n)^(i-1) ((n - k)/n)
$

So:

$
r_(k,n) &= sum_(i=1)^∞ i p_n (i, k) \
&= sum_(i=1)^∞ i [(k/n)^(i-1) ((n - k)/n)] \
&= (n-k)/n sum_(i=1)^∞  i(k/n)^(i-1)
$



