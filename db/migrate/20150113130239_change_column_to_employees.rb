class ChangeColumnToEmployees < ActiveRecord::Migration
  def change
      def change
        def up
          change_column :employees, :passport_expiry, :date
        end

        def down
          change_column :employees, :passport_expiry, :string
        end
      end
  end
end
