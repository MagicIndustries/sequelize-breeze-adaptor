/* jshint indent: 2 */

module.exports = function(sequelize, DataTypes) {
  return sequelize.define('LearningArea', {
    tableName: "spa_vLearningArea",
    freezeTableName: true,

    learningAreaID: {
      type: DataTypes.INTEGER(11),
      allowNull: false,
    },
    name: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    description: {
      type: DataTypes.STRING,
      allowNull: true,
    },
    tenantID: {
      type: DataTypes.STRING,
      allowNull: true,
    },
    organizationID: {
      type: DataTypes.INTEGER(11),
      allowNull: true,
    },
    createdAt: {
      type: DataTypes.DATE,
      allowNull: false,
      defaultValue: 'CURRENT_TIMESTAMP'
    },
    updatedAt: {
      type: DataTypes.DATE,
      allowNull: false,
      defaultValue: '0000-00-00 00:00:00'
    },
    createdBy: {
      type: DataTypes.INTEGER(11),
      allowNull: false,
    },
    updatedBy: {
      type: DataTypes.INTEGER(11),
      allowNull: false,
    }
  });
};
