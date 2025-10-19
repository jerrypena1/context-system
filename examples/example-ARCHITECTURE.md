# Architecture Documentation

**Last Updated**: [Date] (Phase X Complete)

---

## System Overview

[Brief description of the system - monorepo vs single package, frontend/backend/database/external APIs, how components communicate]

**Example**:
- Lerna monorepo with `/packages/frontend` and `/packages/backend`
- Frontend: React SPA
- Backend: Node.js Express API + PostgreSQL
- Communication: REST API on http://localhost:5000

---

## Project Structure

```
/
├── [your project structure here]
│   ├── src/
│   │   ├── components/
│   │   ├── services/
│   │   └── ...
├── docs/
│   ├── tasks/
│   ├── ARCHITECTURE.md (this file)
│   └── ...
└── ...
```

---

## Frontend Architecture (if applicable)

### Tech Stack
[List key dependencies with versions]

### State Management
[Describe state management approach - Redux, MobX, Context, Zustand, etc.]

**Stores/Slices**:
- [StoreName] - [What it manages]

### Component Organization
[How components are organized - by feature, by type, atomic design, etc.]

### Routing Structure
[Routes and their purposes]

### Theme/Styling System
[CSS-in-JS, CSS modules, Tailwind, theme configuration, etc.]

---

## Backend Architecture (if applicable)

### Tech Stack
[List key dependencies]

### Database Schema
[Tables, relationships, key fields]

### Routes
[API endpoints and what they do]

### Services
[Business logic layer - what services exist and their responsibilities]

---

## Data Flow

[Describe how data flows through the system]

### Example Flow 1: [Name]
1. User action → Frontend component
2. Component calls store action
3. Store calls API
4. Backend route → Service → Database
5. Response → Store updates → Component re-renders

---

## API Communication

### API Client
[How frontend communicates with backend - axios, fetch, tRPC, GraphQL, etc.]

### Endpoints
[List of endpoints or link to API docs]

---

## Key Development Patterns

### [Pattern 1 - e.g., Store Pattern]
```javascript
// Code example
```

### [Pattern 2 - e.g., Component Pattern]
```javascript
// Code example
```

---

## Running the Application

### Development Mode
```bash
# Commands to run the app in dev mode
```

### Production Build
```bash
# Commands to build for production
```

---

## Phase-Specific Notes

### Phase X - Current Status
- ✅ Complete: [items]
- ⏸️ Deferred: [items]

---

## Dependencies

### [Frontend/Backend/etc]
```json
{
  "dependency": "version"
}
```

---

## Future Enhancements

**Phase X**: [What's planned]
**Phase Y**: [What's planned]

---

**Update Instructions**: Update this file after completing each phase with new files, stores, routes, services, or architectural changes.
