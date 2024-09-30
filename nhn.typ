= URL Shorterner Performance
#show math.equation: set text(font: "New Computer Modern Math")
#set math.equation(
  numbering: (..nums) => numbering("(1)", ..nums),
  number-align: bottom, 
  supplement: none
)
The total cost, $C_n$, of shortening the maximum number of URLs, $n$, is given by:

$
C_n = sum_(k=0)^(n-1) r_(k,n)
$ <cost>

where $r_(k,n)$ is the cost of finding an available shortened URL at random, when $k$ out of $n$ are unavailable (already taken).

Clearly:
$
r_(k,n) = sum_(i=1)^∞ i p_n (i, k)
$ <find>
where $p_n (i, k)$ is the probability of finding an available URL on the $i$th attempt when $k$ out of $n$ are already taken.
$
&p_n (1, k) = (n - k)/n \

&p_n (2, k) = (k/n) ((n - k)/n) \

&⋮ \

&p_n (i, k) = (k/n)^(i-1) ((n - k)/n)
$ <prob>

So:
$
r_(k,n) &= sum_(i=1)^∞ i p_n (i, k) && #h(5em) "from" #[@find] \
&= sum_(i=1)^∞ i [(k/n)^(i-1) ((n - k)/n)] && #h(5em) "substituting" #[@prob] \
&= (n-k)/n sum_(i=1)^∞  i(k/n)^(i-1)
$ <find2>
#pagebreak()
#set math.equation(numbering: none)
Let$
α &= k/n && #h(5em) "(note" α<1 ")"
$
#set math.equation(
  numbering: (..nums) => numbering("(1)", ..nums)
)
#import "@preview/physica:0.9.1": * 
and let $
S_α &= sum_(i=1)^∞ i α^(i-1) \
    &= sum_(i=1)^∞ dv(, α) α^i \
    &= dv(, α) sum_(i=1)^∞ α^i \
    &= dv(, α) ((sum_(i=0)^∞ α^i) - 1) \
    &= dv(, α) sum_(i=0)^∞ α^i \
    &= dv(, α) (1/(1-α)) && #h(5em) "see Geometric Series on wikipedia" \
    &= 1 / (1-α)^2
$ <geom>
#line(length: 100%)
Therefore:
$
r_(k,n) &= (n-k)/n sum_(i=1)^∞ i(k/n)^(i-1) && #h(5em) "from" #[@find2] \
        &= (n-k)/n (1 / (1-k/n)^2) && #h(5em) "using"
        #[@geom] \
        &= (1-k/n) (1 / (1-k/n)^2) \
        &= 1 / (1-k/n) \
        &= n / (n-k)
$ <find3>
#pagebreak()
#set math.equation(numbering: none)
So:
$
C_n &= sum_(k=0)^(n-1) r_(k,n) && #h(5em) "by definition" #[@cost] \
    &= sum_(k=0)^(n-1) n / (n-k) && #h(5em) "by" #[@find3] \
    &= n sum_(k=0)^(n-1) 1 / (n-k) \
    &= n sum_(j=1)^n 1/j && #h(5em) "subsituting" j = n - k \
    &= n H_n
$
where $
H_n = sum_(j=1)^n 1/j
$
is the $n$th _Harmonic number_.
#line(length: 100%)
== Example

If $n=26000$, the total cost is: $
C_26000 &= 26000 #sym.times H_26000 \
        &≈ 26000 #sym.times 10.743 && #h(5em) "(using Wolfram alpha)" \
        &= 279318
$