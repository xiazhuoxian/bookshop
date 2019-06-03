package com.bookshop.beans;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class TradeExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public TradeExample() {
        oredCriteria = new ArrayList<Criteria>();
    }

    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    public String getOrderByClause() {
        return orderByClause;
    }

    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    public boolean isDistinct() {
        return distinct;
    }

    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }

    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    public Criteria or() {
        Criteria criteria = createCriteriaInternal();
        oredCriteria.add(criteria);
        return criteria;
    }

    public Criteria createCriteria() {
        Criteria criteria = createCriteriaInternal();
        if (oredCriteria.size() == 0) {
            oredCriteria.add(criteria);
        }
        return criteria;
    }

    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    public void clear() {
        oredCriteria.clear();
        orderByClause = null;
        distinct = false;
    }

    protected abstract static class GeneratedCriteria {
        protected List<Criterion> criteria;

        protected GeneratedCriteria() {
            super();
            criteria = new ArrayList<Criterion>();
        }

        public boolean isValid() {
            return criteria.size() > 0;
        }

        public List<Criterion> getAllCriteria() {
            return criteria;
        }

        public List<Criterion> getCriteria() {
            return criteria;
        }

        protected void addCriterion(String condition) {
            if (condition == null) {
                throw new RuntimeException("Value for condition cannot be null");
            }
            criteria.add(new Criterion(condition));
        }

        protected void addCriterion(String condition, Object value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value));
        }

        protected void addCriterion(String condition, Object value1, Object value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value1, value2));
        }

        public Criteria andTradeidIsNull() {
            addCriterion("tradeid is null");
            return (Criteria) this;
        }

        public Criteria andTradeidIsNotNull() {
            addCriterion("tradeid is not null");
            return (Criteria) this;
        }

        public Criteria andTradeidEqualTo(Integer value) {
            addCriterion("tradeid =", value, "tradeid");
            return (Criteria) this;
        }

        public Criteria andTradeidNotEqualTo(Integer value) {
            addCriterion("tradeid <>", value, "tradeid");
            return (Criteria) this;
        }

        public Criteria andTradeidGreaterThan(Integer value) {
            addCriterion("tradeid >", value, "tradeid");
            return (Criteria) this;
        }

        public Criteria andTradeidGreaterThanOrEqualTo(Integer value) {
            addCriterion("tradeid >=", value, "tradeid");
            return (Criteria) this;
        }

        public Criteria andTradeidLessThan(Integer value) {
            addCriterion("tradeid <", value, "tradeid");
            return (Criteria) this;
        }

        public Criteria andTradeidLessThanOrEqualTo(Integer value) {
            addCriterion("tradeid <=", value, "tradeid");
            return (Criteria) this;
        }

        public Criteria andTradeidIn(List<Integer> values) {
            addCriterion("tradeid in", values, "tradeid");
            return (Criteria) this;
        }

        public Criteria andTradeidNotIn(List<Integer> values) {
            addCriterion("tradeid not in", values, "tradeid");
            return (Criteria) this;
        }

        public Criteria andTradeidBetween(Integer value1, Integer value2) {
            addCriterion("tradeid between", value1, value2, "tradeid");
            return (Criteria) this;
        }

        public Criteria andTradeidNotBetween(Integer value1, Integer value2) {
            addCriterion("tradeid not between", value1, value2, "tradeid");
            return (Criteria) this;
        }

        public Criteria andUseridIsNull() {
            addCriterion("userid is null");
            return (Criteria) this;
        }

        public Criteria andUseridIsNotNull() {
            addCriterion("userid is not null");
            return (Criteria) this;
        }

        public Criteria andUseridEqualTo(Integer value) {
            addCriterion("userid =", value, "userid");
            return (Criteria) this;
        }

        public Criteria andUseridNotEqualTo(Integer value) {
            addCriterion("userid <>", value, "userid");
            return (Criteria) this;
        }

        public Criteria andUseridGreaterThan(Integer value) {
            addCriterion("userid >", value, "userid");
            return (Criteria) this;
        }

        public Criteria andUseridGreaterThanOrEqualTo(Integer value) {
            addCriterion("userid >=", value, "userid");
            return (Criteria) this;
        }

        public Criteria andUseridLessThan(Integer value) {
            addCriterion("userid <", value, "userid");
            return (Criteria) this;
        }

        public Criteria andUseridLessThanOrEqualTo(Integer value) {
            addCriterion("userid <=", value, "userid");
            return (Criteria) this;
        }

        public Criteria andUseridIn(List<Integer> values) {
            addCriterion("userid in", values, "userid");
            return (Criteria) this;
        }

        public Criteria andUseridNotIn(List<Integer> values) {
            addCriterion("userid not in", values, "userid");
            return (Criteria) this;
        }

        public Criteria andUseridBetween(Integer value1, Integer value2) {
            addCriterion("userid between", value1, value2, "userid");
            return (Criteria) this;
        }

        public Criteria andUseridNotBetween(Integer value1, Integer value2) {
            addCriterion("userid not between", value1, value2, "userid");
            return (Criteria) this;
        }

        public Criteria andTradetimeIsNull() {
            addCriterion("tradetime is null");
            return (Criteria) this;
        }

        public Criteria andTradetimeIsNotNull() {
            addCriterion("tradetime is not null");
            return (Criteria) this;
        }

        public Criteria andTradetimeEqualTo(Date value) {
            addCriterion("tradetime =", value, "tradetime");
            return (Criteria) this;
        }

        public Criteria andTradetimeNotEqualTo(Date value) {
            addCriterion("tradetime <>", value, "tradetime");
            return (Criteria) this;
        }

        public Criteria andTradetimeGreaterThan(Date value) {
            addCriterion("tradetime >", value, "tradetime");
            return (Criteria) this;
        }

        public Criteria andTradetimeGreaterThanOrEqualTo(Date value) {
            addCriterion("tradetime >=", value, "tradetime");
            return (Criteria) this;
        }

        public Criteria andTradetimeLessThan(Date value) {
            addCriterion("tradetime <", value, "tradetime");
            return (Criteria) this;
        }

        public Criteria andTradetimeLessThanOrEqualTo(Date value) {
            addCriterion("tradetime <=", value, "tradetime");
            return (Criteria) this;
        }

        public Criteria andTradetimeIn(List<Date> values) {
            addCriterion("tradetime in", values, "tradetime");
            return (Criteria) this;
        }

        public Criteria andTradetimeNotIn(List<Date> values) {
            addCriterion("tradetime not in", values, "tradetime");
            return (Criteria) this;
        }

        public Criteria andTradetimeBetween(Date value1, Date value2) {
            addCriterion("tradetime between", value1, value2, "tradetime");
            return (Criteria) this;
        }

        public Criteria andTradetimeNotBetween(Date value1, Date value2) {
            addCriterion("tradetime not between", value1, value2, "tradetime");
            return (Criteria) this;
        }
    }

    public static class Criteria extends GeneratedCriteria {

        protected Criteria() {
            super();
        }
    }

    public static class Criterion {
        private String condition;

        private Object value;

        private Object secondValue;

        private boolean noValue;

        private boolean singleValue;

        private boolean betweenValue;

        private boolean listValue;

        private String typeHandler;

        public String getCondition() {
            return condition;
        }

        public Object getValue() {
            return value;
        }

        public Object getSecondValue() {
            return secondValue;
        }

        public boolean isNoValue() {
            return noValue;
        }

        public boolean isSingleValue() {
            return singleValue;
        }

        public boolean isBetweenValue() {
            return betweenValue;
        }

        public boolean isListValue() {
            return listValue;
        }

        public String getTypeHandler() {
            return typeHandler;
        }

        protected Criterion(String condition) {
            super();
            this.condition = condition;
            this.typeHandler = null;
            this.noValue = true;
        }

        protected Criterion(String condition, Object value, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.typeHandler = typeHandler;
            if (value instanceof List<?>) {
                this.listValue = true;
            } else {
                this.singleValue = true;
            }
        }

        protected Criterion(String condition, Object value) {
            this(condition, value, null);
        }

        protected Criterion(String condition, Object value, Object secondValue, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.secondValue = secondValue;
            this.typeHandler = typeHandler;
            this.betweenValue = true;
        }

        protected Criterion(String condition, Object value, Object secondValue) {
            this(condition, value, secondValue, null);
        }
    }
}