# frozen_string_literal: true

module EducateNavigationHelper
  def educate_navigation(active:)
    tag.ul(class: 'nav') do
      safe_join(items.map do |item|
        classes = %w[nav-link]
        classes << 'active' if active == item[:name]

        tag.li(class: 'nav-item') do
          link_to(item[:title], item[:path], class: classes)
        end
      end)
    end
  end

  private

  def items
    [
      { name: :educate, title: 'Opleiden op RHC', path: '/opleiden-op-rhc' },
      { name: :steps, title: _('3 methodical steps'), path: steps_path },
      { name: :principles, title: _('8 tactical principles'), path: principles_path }
    ]
  end
end
