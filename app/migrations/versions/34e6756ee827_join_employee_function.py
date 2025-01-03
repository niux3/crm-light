"""join employee function

Revision ID: 34e6756ee827
Revises: 8d950b8bed7f
Create Date: 2025-01-03 01:06:18.773052

"""
from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision = '34e6756ee827'
down_revision = '8d950b8bed7f'
branch_labels = None
depends_on = None


def upgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    with op.batch_alter_table('companies_employees', schema=None) as batch_op:
        batch_op.add_column(sa.Column('function_id', sa.Integer(), nullable=True))
        batch_op.create_foreign_key(None, 'companies_functions', ['function_id'], ['id'], onupdate='CASCADE', ondelete='CASCADE')

    # ### end Alembic commands ###


def downgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    with op.batch_alter_table('companies_employees', schema=None) as batch_op:
        batch_op.drop_constraint(None, type_='foreignkey')
        batch_op.drop_column('function_id')

    # ### end Alembic commands ###
