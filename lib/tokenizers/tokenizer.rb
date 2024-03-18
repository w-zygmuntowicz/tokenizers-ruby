module Tokenizers
  class Tokenizer
    extend FromPretrained

    def to_s(pretty: false)
      _to_s(pretty)
    end

    def save(path, pretty: false)
      _save(path, pretty)
    end

    def encode(sequence, pair = nil, is_pretokenized: false, add_special_tokens: true)
      _encode(sequence, pair, is_pretokenized, add_special_tokens)
    end

    def encode_batch(input, is_pretokenized: false, add_special_tokens: true)
      _encode_batch(input, is_pretokenized, add_special_tokens)
    end

    def decode(ids, skip_special_tokens: true, clean_up_tokenization_spaces: true)
      output = _decode(ids, skip_special_tokens)
      return output unless clean_up_tokenization_spaces

      output.gsub(" .", ".")
            .gsub(" ?", "?")
            .gsub(" !", "!")
            .gsub(" ,", ",")
            .gsub(" ' ", "'")
            .gsub(" n't", "n't")
            .gsub(" 'm", "'m")
            .gsub(" 's", "'s")
            .gsub(" 've", "'ve")
            .gsub(" 're", "'re")
    end

    def decode_batch(sequences, skip_special_tokens: true)
      _decode_batch(sequences, skip_special_tokens)
    end

    def enable_padding(**options)
      _enable_padding(options)
    end

    def enable_truncation(max_length, **options)
      _enable_truncation(max_length, options)
    end

    def vocab(with_added_tokens: true)
      _vocab(with_added_tokens)
    end

    def vocab_size(with_added_tokens: true)
      _vocab_size(with_added_tokens)
    end
  end
end
