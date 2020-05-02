function Pprime = LogisticWithHarvesting(~, P, r, N, H)
    Pprime = r*P*(1-P/N)-H;
end

