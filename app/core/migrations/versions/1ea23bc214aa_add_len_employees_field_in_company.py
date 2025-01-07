"""add len_employees field in company

Revision ID: 1ea23bc214aa
Revises: a8a18705b048
Create Date: 2025-01-07 14:33:23.521855

"""
from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision = '1ea23bc214aa'
down_revision = 'a8a18705b048'
branch_labels = None
depends_on = None


def upgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    with op.batch_alter_table('companies_companies', schema=None) as batch_op:
        batch_op.add_column(sa.Column('len_employees', sa.Integer(), nullable=True))

    # ### end Alembic commands ###


def downgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    with op.batch_alter_table('companies_companies', schema=None) as batch_op:
        batch_op.drop_column('len_employees')

    # ### end Alembic commands ###
