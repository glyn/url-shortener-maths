= Random hole filling theorem
#show math.equation: set text(font: "New Computer Modern Math")
#set math.equation(numbering: "(1)", number-align: bottom)
Suppose $n$ is a positive integer and there are $n$ balls and $n$ empty holes. Each hole has room for just one ball. Suppose each ball in turn is thrown at random into one of the holes. If the hole is empty, the ball is left in the hole and the next ball is thrown. However, if there is already a ball in the hole, the ball that has just been thrown is picked up and thrown again at random into one of the holes. This process continues until each ball has been thrown into an empty hole.

== Theorem

The expected number of throws, $T_n$, required to fill all the holes is $n H_n$ where:
$
H_n = sum_(j=1)^n 1/j
$
is the $n$th Harmonic number.

#line(length: 100%)
== Proof

The expected number of throws, $T_n$, is given by:

$
T_n = sum_(k=0)^(n-1) r_(k,n)
$ <cost>

where $r_(k,n)$ is the expected number of throws required to fill an empty hole when $k$ out of $n$ holes are already filled.

Clearly:
$
r_(k,n) = sum_(i=1)^∞ i p_n (i, k)
$ <find>
where $p_n (i, k)$ is the probability of throwing a ball into an empty hole on the $i$th attempt when $k$ out of $n$ are already filled.
$
&p_n (1, k) = (n - k)/n \

&p_n (2, k) = (k/n) ((n - k)/n) \

&⋮ \

&p_n (i, k) = (k/n)^(i-1) ((n - k)/n)
$

So:
$
r_(k,n) &= sum_(i=1)^∞ i p_n (i, k) && "        from (2)" \
&= sum_(i=1)^∞ i [(k/n)^(i-1) ((n - k)/n)] && "        substituting (3)" \
&= (n-k)/n sum_(i=1)^∞  i(k/n)^(i-1)
$
#pagebreak()
#set math.equation(numbering: none)
Let$
α &= k/n && "        (note" 0<α<1 ")"
$
#set math.equation(numbering: "(1)")
#import "@preview/physica:0.9.1": * 
and let $
S_α &= sum_(i=1)^∞ i α^(i-1) \
    &= sum_(i=1)^∞ dv(, α) α^i \
    &= dv(, α) sum_(i=1)^∞ α^i \
    &= dv(, α) ((sum_(i=0)^∞ α^i) - 1) \
    &= dv(, α) sum_(i=0)^∞ α^i \
    &= dv(, α) (1/(1-α)) & "        (see Geometric Series on wikipedia)" \
    &= 1 / (1-α)^2
$
#line(length: 100%)
Therefore:
$
r_(k,n) &= (n-k)/n sum_(i=1)^∞ i(k/n)^(i-1) & "        from (4)" \
        &= (n-k)/n (1 / (1-k/n)^2) &"         using (5)" \
        &= (1-k/n) (1 / (1-k/n)^2) \
        &= 1 / (1-k/n) \
        &= n / (n-k)
$
#pagebreak()
#set math.equation(numbering: none)
So:
$
T_n &= sum_(k=0)^(n-1) r_(k,n) & "        by definition (1)" \
    &= sum_(k=0)^(n-1) n / (n-k) & "        by (6)" \
    &= n sum_(k=0)^(n-1) 1 / (n-k) \
    &= n sum_(j=1)^n 1/j & "        subsituting " j = n - k \
    &= n H_n
$
#line(length: 100%)
== Example

If $n=26000$, the expected number of throws is:
$
T_26000 &= 26000 H_26000 \
        &≈ 26000 #sym.times 10.743 & "        (using Wolfram alpha)" \
        &= 279318
$