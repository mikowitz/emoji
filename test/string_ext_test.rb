require 'emoji/string_ext'

describe String, 'with Emoji extensions' do
  describe '#with_emoji_images' do
    it 'should replace unicode moji with an img tag' do
      base_string = "I ❤ Emoji"
      replaced_string = base_string.with_emoji_images
      assert_equal "I <img class=\"emoji\" src=\"http://localhost:3000/heart.png\"> Emoji", replaced_string
    end

    it 'should always return an html_safe string' do
      string = '❤'
      string.stubs(:html_safe => 'safe!')
      replaced_string = string.with_emoji_images

      assert_equal 'safe!', replaced_string
    end
  end

  describe '#image_url' do
    it 'should generate image_url' do
      assert_equal 'http://localhost:3000/cyclone.png', '🌀'.image_url
      assert_equal 'http://localhost:3000/cyclone.png', 'cyclone'.image_url
    end
  end

  describe '#emoji_data' do
    it 'should find data for a name or a moji' do
      data_from_moji = '❤'.emoji_data
      data_from_string = 'heart'.emoji_data

      assert_equal data_from_moji, data_from_string
    end
  end
end
