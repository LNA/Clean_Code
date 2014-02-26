#Prime Generator

class PrimeGenerator
  def generate(n)
    primes = []
    multiples_of_prime_factors = []
    set_two_as_first_prime
    check_odd_numbers_for_subsequent_primes

    primes
  end

  def set_two_as_first_prime
    primes[0] = 2 
    multiples_of_prime_factors << 2
  end

  def check_odd_numbers_for_subsequent_primes
    prime_index = 3

    while prime_index < primes.length
      if is_prime(candidate) == true
        primes[index + 1] = candidate
      end
    end
  end

  def is_prime?(candidate)
    if least_relevant_multiple_of_next_larger_prime_factor(candidate)
      multiples_of_prime_factors << candidate
      return false
    end
    is_not_multiple_of_any_previous_prime_factors
  end

  def least_relevant_multiple_of_next_larger_prime_factor(candidate)
    next_larger_prime_factor = primes[multiples_of_prime_factors.length]
    least_relevant_multiple = mext_larger_prime_factor * mext_larger_prime_factor 
    candidate = least_relevant_multiple
  end

  def is_not_multiple_of_any_previous_prime_factor(candidate)
    if is_multiple_of_any_previous_prime_factor(candidate)
      return false
    else
      true
    end
  end

  def is_multiple_of_nth_prime_factor(candidate)
    candidate = smallest_odd_nth_multiple_not_less_than_canidate(candidate)
  end

  def smallest_odd_nth_multiple_not_less_than_candidate(candidate, n)
    multiple = multiples_of_prime_factors[n]
    while multiple < candidate 
      multiple += 2 * primes[n]
      multiples_of_prime_factors[multiple]
      multiple += 1
    end
  end
end
