"""create some models

Revision ID: f24f00c91024
Revises: 36552c2b3522
Create Date: 2025-01-03 00:40:14.385138

"""
from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision = 'f24f00c91024'
down_revision = '36552c2b3522'
branch_labels = None
depends_on = None


def upgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.create_table('companies_civilities',
    sa.Column('id', sa.Integer(), nullable=False),
    sa.Column('name', sa.String(), nullable=True),
    sa.Column('slug', sa.String(), nullable=True),
    sa.Column('created', sa.DateTime(), nullable=True),
    sa.Column('updated', sa.DateTime(), nullable=True),
    sa.PrimaryKeyConstraint('id')
    )
    op.create_table('companies_employees',
    sa.Column('id', sa.Integer(), nullable=False),
    sa.Column('firstname', sa.String(), nullable=True),
    sa.Column('lastname', sa.String(), nullable=True),
    sa.Column('slug', sa.String(), nullable=True),
    sa.Column('email', sa.String(), nullable=True),
    sa.Column('blacklist', sa.Boolean(), nullable=True),
    sa.Column('date_blacklist', sa.DateTime(), nullable=True),
    sa.Column('description_blacklist', sa.Text(), nullable=True),
    sa.Column('website', sa.String(), nullable=True),
    sa.Column('mobile', sa.String(), nullable=True),
    sa.Column('phone', sa.String(), nullable=True),
    sa.Column('description', sa.Text(), nullable=True),
    sa.Column('created', sa.DateTime(), nullable=True),
    sa.Column('updated', sa.DateTime(), nullable=True),
    sa.PrimaryKeyConstraint('id'),
    sa.UniqueConstraint('slug')
    )
    op.create_table('companies_functions',
    sa.Column('id', sa.Integer(), nullable=False),
    sa.Column('name', sa.String(), nullable=True),
    sa.Column('slug', sa.String(), nullable=True),
    sa.Column('created', sa.DateTime(), nullable=True),
    sa.Column('updated', sa.DateTime(), nullable=True),
    sa.PrimaryKeyConstraint('id')
    )
    op.create_table('companies_sector_of_activities',
    sa.Column('id', sa.Integer(), nullable=False),
    sa.Column('name', sa.String(), nullable=True),
    sa.Column('slug', sa.String(), nullable=True),
    sa.Column('created', sa.DateTime(), nullable=True),
    sa.Column('updated', sa.DateTime(), nullable=True),
    sa.PrimaryKeyConstraint('id')
    )
    # ### end Alembic commands ###


def downgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.drop_table('companies_sector_of_activities')
    op.drop_table('companies_functions')
    op.drop_table('companies_employees')
    op.drop_table('companies_civilities')
    # ### end Alembic commands ###
